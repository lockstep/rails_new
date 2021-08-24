import HeaderGroupedTable from "../../components/table/HeaderGroupedTable"
function PropertyPage() {
    const columns = React.useMemo(
      () => [
        {
          Header: 'Name',
          columns: [
            {
              Header: 'First Name',
              accessor: 'firstName',
            },
            {
              Header: 'Last Name',
              accessor: 'lastName',
            },
          ],
        },
        {
          Header: 'Info',
          columns: [
            {
              Header: 'Age',
              accessor: 'age',
            },
            {
              Header: 'Visits',
              accessor: 'visits',
            },
            {
              Header: 'Status',
              accessor: 'status',
            },
            {
              Header: 'Profile Progress',
              accessor: 'progress',
            },
          ],
        },
      ],
      []
    )
  
    const data = React.useMemo(() => makeData(20), [])
  
    return (
      <div>
        <HeaderGroupedTable columns={columns} data={data} />
      </div>
    )
  }
  
  export default PropertyPage
  