interface Props {
  nPages: number;
  currentPage: number;
  setCurrentPage: React.Dispatch<React.SetStateAction<number>>;
}

const Pagination = ({ nPages, currentPage, setCurrentPage }: Props) => {
  const pageNumbers = [...Array(nPages + 1).keys()].slice(1);

  const nextPage = () => {
    if (currentPage !== nPages) setCurrentPage(currentPage + 1);
  };
  const prevPage = () => {
    if (currentPage !== 1) setCurrentPage(currentPage - 1);
  };
  return (
    <nav>
      <ul className="flex  ">
        {currentPage !== 1 && (
          <li className="m-2">
            <a className="text-blue-600" onClick={prevPage} href="#">
              Previous
            </a>
          </li>
        )}

        {pageNumbers.map((pgNumber) => (
          <li key={pgNumber} className={`m-2 flex  `}>
            <a
              onClick={() => setCurrentPage(pgNumber)}
              className={`${currentPage == pgNumber ? "text-black" : "text-blue-600"} `}
              href="#"
            >
              {pgNumber}
            </a>
          </li>
        ))}
        {pageNumbers.length !== currentPage && (
          <li className="m-2">
            <a className="text-blue-600" onClick={nextPage} href="#">
              Next
            </a>
          </li>
        )}
      </ul>
    </nav>
  );
};

export default Pagination;
