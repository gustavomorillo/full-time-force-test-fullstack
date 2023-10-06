import { BadRequestException, Controller, Get } from '@nestjs/common';
import { CommitsService } from './commits.service';

@Controller('commits')
export class CommitsController {
  constructor(private readonly commitsService: CommitsService) {}

  @Get('listCommits')
  async listAllCommits() {
    try {
      return await this.commitsService.getCommits();
    } catch (e) {
      throw new BadRequestException(e.message);
    }
  }
}
