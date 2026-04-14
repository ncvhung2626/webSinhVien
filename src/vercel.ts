import type { VercelRequest, VercelResponse } from '@vercel/node';
import serverless from 'serverless-http';
import type { Handler } from 'serverless-http';
import type { NestExpressApplication } from '@nestjs/platform-express';
import { createApp } from './main';

let cachedHandler: Handler | null = null;

async function getHandler() {
  if (cachedHandler) return cachedHandler;

  const app: NestExpressApplication = await createApp();
  const expressApp = app.getHttpAdapter().getInstance();

  cachedHandler = serverless(expressApp, {
    request: (req) => {
      if (typeof req.url === 'string' && req.url.startsWith('/api')) {
        req.url = req.url.replace(/^\/api/, '') || '/';
      }
      return req;
    },
  });

  return cachedHandler;
}

export default async function handler(req: VercelRequest, res: VercelResponse) {
  const h = await getHandler();
  return h(req as any, res as any);
}
