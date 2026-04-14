"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.default = handler;
const serverless_http_1 = require("serverless-http");
const main_1 = require("./main");
let cachedHandler = null;
async function getHandler() {
    if (cachedHandler)
        return cachedHandler;
    const app = await (0, main_1.createApp)();
    const expressApp = app.getHttpAdapter().getInstance();
    cachedHandler = (0, serverless_http_1.default)(expressApp, {
        request: (req) => {
            if (typeof req.url === 'string' && req.url.startsWith('/api')) {
                req.url = req.url.replace(/^\/api/, '') || '/';
            }
            return req;
        },
    });
    return cachedHandler;
}
async function handler(req, res) {
    const h = await getHandler();
    return h(req, res);
}
//# sourceMappingURL=vercel.js.map