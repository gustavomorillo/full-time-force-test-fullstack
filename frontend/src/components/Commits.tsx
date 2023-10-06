import { useEffect, useState } from "react";
import { ImageLogoUrl } from "../utils/constants";
import { CommitsCard } from "./CommitsCard";
import { GetCommitsResponse } from "../utils/interfaces";
import Pagination from "./Pagination";

import { CssSkeleton } from "./CssSkeleton";
import { LogoImg } from "./LogoImg";
import { getCommits } from "../services/getCommits";

export const Commits = () => {
  const [commitsData, setCommitsData] = useState<GetCommitsResponse[]>([]);
  const [loading, setLoading] = useState(true);
  const [, setError] = useState(false);
  const [currentPage, setCurrentPage] = useState(1);
  const [recordsPerPage] = useState(4);
  const indexOfLastRecord = currentPage * recordsPerPage;
  const indexOfFirstRecord = indexOfLastRecord - recordsPerPage;
  const currentRecords = commitsData.slice(indexOfFirstRecord, indexOfLastRecord);
  const nPages = Math.ceil(commitsData.length / recordsPerPage);

  const getCommitsData = async () => {
    try {
      getCommits()
        .then((response) => {
          setCommitsData(response);
          setLoading(false);
        })
        .catch((error) => console.error(error));
    } catch (error) {
      setError(true);
      setLoading(false);
    }
  };
  useEffect(() => {
    getCommitsData();
  }, []);

  return (
    <div className="flex justify-center mt-20 flex-col items-center">
      <LogoImg img={ImageLogoUrl} />
      <h1 className="text-center mb-10 text-xl font-bold px-10 md:px-0 md:ml-20 ">
        List of Commits - Full Time Force Test
      </h1>

      {loading ? (
        <CssSkeleton />
      ) : (
        <>
          <ul className="divide-y divide-gray-100 w-12/12">
            {currentRecords.map(({ commit, committer, sha }: GetCommitsResponse) => (
              <CommitsCard commit={commit} committer={committer} key={sha} />
            ))}
          </ul>
          <Pagination nPages={nPages} currentPage={currentPage} setCurrentPage={setCurrentPage} />
        </>
      )}
    </div>
  );
};
