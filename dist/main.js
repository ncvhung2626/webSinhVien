"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.createApp = createApp;
const core_1 = require("@nestjs/core");
const common_1 = require("@nestjs/common");
const path_1 = require("path");
const app_module_1 = require("./app.module");
async function createApp() {
    const app = await core_1.NestFactory.create(app_module_1.AppModule);
    app.useStaticAssets((0, path_1.join)(process.cwd(), 'public'));
    app.useGlobalPipes(new common_1.ValidationPipe({
        whitelist: true,
        transform: true,
        forbidNonWhitelisted: false,
    }));
    app.enableCors({ origin: '*' });
    await app.init();
    return app;
}
async function bootstrap() {
    const app = await createApp();
    const port = process.env.PORT || 3000;
    await app.listen(port);
    console.log(`EduPortal QLSV (Unified MVC) đang chạy tại http://localhost:${port}`);
}
bootstrap();
//# sourceMappingURL=main.js.map