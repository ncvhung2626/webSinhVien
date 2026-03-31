import { NestFactory }            from '@nestjs/core';
import { NestExpressApplication } from '@nestjs/platform-express';
import { ValidationPipe }         from '@nestjs/common';
import { join }                   from 'path';
import { AppModule }              from './app.module';

export async function createApp() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);

  // process.cwd() luôn trỏ về root project E:\qlsv-fixed
  app.useStaticAssets(join(process.cwd(), 'public'));

  app.useGlobalPipes(new ValidationPipe({
    whitelist:            true,
    transform:            true,
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
  console.log(`EduPortal QLSV đang chạy tại http://localhost:${port}`);
}
bootstrap();
