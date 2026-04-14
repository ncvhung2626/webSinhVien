"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.PaymentController = void 0;
const common_1 = require("@nestjs/common");
const payment_service_1 = require("./payment.service");
const payment_dto_1 = require("./dto/payment.dto");
let PaymentController = class PaymentController {
    constructor(paymentService) {
        this.paymentService = paymentService;
    }
    async taoUrl(dto, req) {
        const ipAddr = req.headers['x-forwarded-for']?.split(',')[0].trim() ||
            req.socket.remoteAddress ||
            '127.0.0.1';
        return this.paymentService.taoUrlThanhToan(dto, ipAddr);
    }
    async vnpayCallback(req, res) {
        try {
            const query = req.query;
            console.log('[VNPAY CALLBACK] raw query:', JSON.stringify(query, null, 2));
            const result = await this.paymentService.xuLyCallback(query);
            if (result.code === '00') {
                return res.redirect('/sinh-vien?tab=lich-su-dang-ky&payment=success');
            }
            return res.redirect(`/sinh-vien?tab=dang-ky-hoc&payment=failed&code=${result.code}`);
        }
        catch (err) {
            console.error('VNPay callback error:', err.message);
            return res.redirect('/sinh-vien?tab=dang-ky-hoc&payment=failed&code=99');
        }
    }
    findBySinhVien(svId) {
        return this.paymentService.findBySinhVien(svId);
    }
    findOne(id) {
        return this.paymentService.findOne(id);
    }
};
exports.PaymentController = PaymentController;
__decorate([
    (0, common_1.Post)('tao-url'),
    __param(0, (0, common_1.Body)()),
    __param(1, (0, common_1.Req)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [payment_dto_1.TaoUrlVnpayDto, Object]),
    __metadata("design:returntype", Promise)
], PaymentController.prototype, "taoUrl", null);
__decorate([
    (0, common_1.Get)('vnpay-callback'),
    __param(0, (0, common_1.Req)()),
    __param(1, (0, common_1.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object, Object]),
    __metadata("design:returntype", Promise)
], PaymentController.prototype, "vnpayCallback", null);
__decorate([
    (0, common_1.Get)('lich-su/:svId'),
    __param(0, (0, common_1.Param)('svId', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], PaymentController.prototype, "findBySinhVien", null);
__decorate([
    (0, common_1.Get)('giao-dich/:id'),
    __param(0, (0, common_1.Param)('id', common_1.ParseIntPipe)),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], PaymentController.prototype, "findOne", null);
exports.PaymentController = PaymentController = __decorate([
    (0, common_1.Controller)('api/payment'),
    __metadata("design:paramtypes", [payment_service_1.PaymentService])
], PaymentController);
//# sourceMappingURL=payment.controller.js.map