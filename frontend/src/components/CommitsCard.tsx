import React, { FC } from "react";
import { Commit, Commiter } from "../utils/interfaces";
import remarkGemoji from "remark-gemoji";
import ReactMarkdown from "react-markdown";

import moment from "moment";

interface Props {
  commit: Commit;
  committer: Commiter;
}

export const CommitsCard: FC<Props> = ({ commit, committer }) => {
  return (
    <li className="flex justify-between gap-x-6 py-5 flex-col items-center md:items-baseline md:flex-row">
      <div className="flex min-w-0 gap-x-4 mb-3 md:mb-0">
        <img className="h-12 w-12 flex-none rounded-full bg-gray-50" src={committer.avatar_url} alt="" />
        <div className="min-w-0 flex-auto">
          <p className="text-sm font-semibold leading-6 text-gray-900">Author</p>
          <p className="text-sm font-semibold leading-6 text-gray-900">{commit.author.name}</p>
          <p className="mt-1 truncate text-xs leading-5 text-gray-500">{commit.author.email}</p>
        </div>
      </div>
      <div className="shrink-0 sm:flex sm:flex-col sm:items-end max-w-sm mb-3 md:mb-0">
        <ReactMarkdown
          className="text-sm leading-6 text-gray-900 text-center"
          children={commit.message}
          remarkPlugins={[remarkGemoji]}
        />
      </div>
      <div className="shrink-0 sm:flex sm:flex-col sm:items-end mb-3 md:mb-0">
        <p className="text-sm leading-6 text-gray-900">@{committer.login}</p>
        <p className="mt-1 text-xs leading-5 text-gray-500">
          <time dateTime={commit.committer.date}>
            {moment(commit.committer.date).startOf("minutes").utcOffset(4).fromNow()}
          </time>
        </p>
      </div>
    </li>
  );
};
