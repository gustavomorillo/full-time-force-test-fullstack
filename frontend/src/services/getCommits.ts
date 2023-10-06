import axios, { AxiosResponse } from "axios";
import { GetCommitsResponse } from "../utils/interfaces";

export const getCommits = async (): Promise<GetCommitsResponse[]> => {
  const response: AxiosResponse<GetCommitsResponse[]> = await axios.get(
    `${process.env.REACT_APP_BASE_URL}/commits/listCommits`
  );

  return response.data;
};
