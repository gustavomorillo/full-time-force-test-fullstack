import { Commits } from "./Commits";
import { getCommits } from "../services/getCommits";
import { Data } from "../utils/Data";
import { render, cleanup, waitFor, screen } from "@testing-library/react";
jest.mock("../services/getCommits");

jest.mock("axios");

afterEach(cleanup);

it("renders Commits component properly finding text Gustavo Morillo", async () => {
  (getCommits as jest.Mock).mockResolvedValue(Data);

  const { asFragment } = render(<Commits />);

  await waitFor(() => {
    expect(screen.getByText(/Gustavo Morillo/i)).toBeInTheDocument();
  });
  expect(asFragment()).toMatchSnapshot();
});
