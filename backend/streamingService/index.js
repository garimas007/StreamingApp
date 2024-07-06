const promClient = require('prom-client');
const express = require('express');
const cookieParser = require('cookie-parser');
require('dotenv').config();
const app = express();
const cors = require('cors');
app.use(cors());
app.use(cookieParser());
app.use(express.json());

const healthRoutes = require('./routes/health.route');
const streamingRoutes = require('./routes/streaming.route');
const register = new promClient.Registry();
promClient.collectDefaultMetrics({ register });

const httpRequestDurationMicroseconds = new promClient.Histogram({
    name: 'http_request_duration_ms',
    help: 'Duration of HTTP requests in ms',
    labelNames: ['method', 'route', 'code'],
    buckets: [0.1, 5, 15, 50, 100, 300, 500, 1000, 3000]
});
register.registerMetric(httpRequestDurationMicroseconds);


app.use((req, res, next) => {
    const end = httpRequestDurationMicroseconds.startTimer();
    res.on('finish', () => {
        end({ method: req.method, route: req.route ? req.route.path : req.path, code: res.statusCode });
    });
    next();
});

app.use('/health', healthRoutes);
app.use('/streaming', streamingRoutes);
//Exposing the metrics
app.get('/metrics', async (req, res) => {
    res.set('Content-Type', register.contentType);
    res.end(await register.metrics());
});

//Starting up the server
app.listen(process.env.PORT, () => {
    console.log(`NPS Calculation service running at port ${process.env.PORT}`);
});
