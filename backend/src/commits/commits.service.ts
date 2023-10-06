import { Injectable } from '@nestjs/common';
import axios from 'axios';

@Injectable()
export class CommitsService {
  async getCommits() {
    try {
      const response = await axios.get(`${process.env.GIT_REPO_URL}/commits`);
      return response.data;
    } catch (error) {
      console.log(error);
      throw new Error(error);
    }
  }
}
