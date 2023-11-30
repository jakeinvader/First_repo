import { useState, useEffect } from "react"
import Header from "./components/Header"
import Form from "./components/Form"
import PatientList from "./components/PatientList"

function App() {

  const [patients, setPatients] = useState([/* segunda solucion sin <React.StrictMode> en main.jsx JSON.parse(localStorage.getItem('patients')) ?? []*/]);
  const [patient, setPatient] = useState({});

  
  useEffect(() => {
    function getLocalStorage() {
      const patientsLS = JSON.parse(localStorage.getItem('patients')) ?? [];
      setPatients(patientsLS)
    }
    getLocalStorage();
  }, []);
  

  useEffect(() => {
    localStorage.setItem('patients', JSON.stringify( patients ));
  }, [patients])


  function deletePatient(id) {
    const updatePatients = patients.filter( patient => patient.id !== id);

    setPatients(updatePatients);
  }

  return (
    <>
    <div className="container mx-auto mt-20">
      <Header />
      <div className="mt-12 md:flex">
        <Form 
          patients={patients}
          setPatients={setPatients}
          patient={patient}
          setPatient={setPatient}
        />
        <PatientList 
          patients={patients}
          setPatient={setPatient}
          deletePatient={deletePatient}
        />
      </div>
    </div>
      
    </>
  )
}

export default App
