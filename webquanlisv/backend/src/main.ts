import { NestFactory } from '@nestjs/core';
import { NestExpressApplication } from '@nestjs/platform-express';
import { AppModule } from './app.module';
import { join } from 'path';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);

  // Serve frontend admin
  app.useStaticAssets(join(process.cwd(), '..', 'fontend'));

  // MỞ KHÓA CORS
  app.enableCors();

  const port = process.env.PORT ?? 3001;
  await app.listen(port);
  console.log(`Admin đang chạy tại http://localhost:${port}`);
}
bootstrap();
