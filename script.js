const coreURL = "https://sagipinasv1.herokuapp.com";
const socket = io(coreURL);

function cancelReport(id) {
  socket.emit("test_cancel", { id: id })

  socket.on("cancel_report", () => {
    renderTable()
  })
}

const dataRow = (count, data) => {
  return (`
 <tr>
 <th scope="row">${count + 1}</th>
  <td>${data.type}</td>
  <td>${data.details}</td>
  <td>
    <button class="btn btn-dark btn-sm" onclick="cancelReport('${data.uid}')">CANCEL</button>
  </td>
</tr>
`);
}

const renderTable = () => {
  document.getElementById('table-data').innerHTML = "";
  axios.get(`${coreURL}/incidents`)
    .then(res => {
      res.data.forEach((item, index) => {
        if (item.status === "unverified") {
          document.getElementById('table-data').innerHTML += dataRow(index, item)
        }
      })
    })
}

renderTable()

socket.on("report", () => {
  renderTable()
})