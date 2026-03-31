import {
  Controller, Get, Post, Put, Delete,
  Param, Body, ParseIntPipe,
  UploadedFile, UseInterceptors,
} from '@nestjs/common';
import { FileInterceptor }                           from '@nestjs/platform-express';
import { diskStorage }                               from 'multer';
import { extname }                                   from 'path';
import { BaiTapService }                             from './bai-tap.service';
import { CreateBaiTapDto, NopBaiDto, ChamDiemDto }  from './dto/bai-tap.dto';

@Controller('api/bai-tap')
export class BaiTapController {
  constructor(private readonly baiTapService: BaiTapService) {}

  @Get('lop/:lopId')
  findByLop(@Param('lopId', ParseIntPipe) lopId: number) {
    return this.baiTapService.findByLop(lopId);
  }

  @Get('sinh-vien/:svId/nop-bai')
  findNopBaiBySinhVien(@Param('svId', ParseIntPipe) svId: number) {
    return this.baiTapService.findNopBaiBySinhVien(svId);
  }

  @Post('nop')
  @UseInterceptors(
    FileInterceptor('file', {
      storage: diskStorage({
        destination: './uploads/bai-tap',
        filename: (_req, file, cb) => {
          const unique = Date.now() + '-' + Math.round(Math.random() * 1e9);
          cb(null, unique + extname(file.originalname));
        },
      }),
      limits: { fileSize: 20 * 1024 * 1024 },
    }),
  )
  nopBai(@Body() dto: NopBaiDto, @UploadedFile() file: Express.Multer.File) {
    const filePath = file ? `uploads/bai-tap/${file.filename}` : undefined;
    return this.baiTapService.nopBai(dto, filePath);
  }

  @Put('nop-bai/:nbId/cham-diem')
  chamDiem(
    @Param('nbId', ParseIntPipe) nbId: number,
    @Body() dto: ChamDiemDto,
  ) {
    return this.baiTapService.chamDiem(nbId, dto);
  }

  @Get(':id/nop-bai')
  findNopBaiByBaiTap(@Param('id', ParseIntPipe) id: number) {
    return this.baiTapService.findNopBaiByBaiTap(id);
  }

  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.baiTapService.findOne(id);
  }

  @Post()
  @UseInterceptors(
    FileInterceptor('fileDinhKem', {
      storage: diskStorage({
        destination: './uploads/de-bai',
        filename: (_req, file, cb) => {
          const unique = Date.now() + '-' + Math.round(Math.random() * 1e9);
          cb(null, unique + extname(file.originalname));
        },
      }),
      limits: { fileSize: 30 * 1024 * 1024 },
    }),
  )
  create(@Body() dto: CreateBaiTapDto, @UploadedFile() file: Express.Multer.File) {
    if (file) {
      dto.fileDinhKem = `uploads/de-bai/${file.filename}`;
    }
    return this.baiTapService.create(dto);
  }

  @Put(':id')
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: Partial<CreateBaiTapDto>,
  ) {
    return this.baiTapService.update(id, dto);
  }

  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.baiTapService.remove(id);
  }
}
