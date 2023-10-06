import axios from "axios";
import { getCommits } from "./getCommits";
import { Data } from "../utils/Data";
jest.mock("axios");

it("should return a successful response if the GET request was successful", async () => {
  const mockResponse = {
    data: Data,
  };

  axios.get = jest.fn().mockResolvedValue(mockResponse);

  const peopleData = await getCommits();

  expect(mockResponse.data).toEqual(peopleData);
});
