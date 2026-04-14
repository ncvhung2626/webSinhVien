import { Controller, Get } from '@nestjs/common';
import { AdminDashboardService } from './dashboard.service';

@Controller('api/admin')
export class AdminDashboardController {
  constructor(private readonly dashboardService: AdminDashboardService) {}

  @Get('dashboard-stats')
  async layDuLieuAdminDashboard() {
    return this.dashboardService.layDuLieuAdminDashboard();
  }
}
