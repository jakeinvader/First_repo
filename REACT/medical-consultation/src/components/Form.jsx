import { useState, useEffect } from 'react';
import Error from './Error';

function Form({ patients, setPatients, patient, setPatient }) {
  
  const [name, setName] = useState('');
  const [owner, setOwner] = useState('');
  const [email, setEmail] = useState('');
  const [date, setDate] = useState('');
  const [symptoms, setSymptoms] = useState('');

  const [error, setError] = useState(false);

  useEffect(() => {
      if (Object.keys(patient).length > 0) 
      {
        setName(patient.name);
        setOwner(patient.owner);
        setEmail(patient.email);
        setDate(patient.date);
        setSymptoms(patient.symptoms);
      }
  }, [patient])

  function generateId() {
    const random = Math.random().toString(36).substring(2);
    const date = Date.now().toString(36);

    return random + date
  }

  function handleSubmit(e) {
    e.preventDefault();
    //validacion del formulario
    if  ([ name, owner, email, date, symptoms ].includes('') ) 
    {
      console.log('There is an empty field');

      setError(true);
      return;
    }

    setError(false);
    
    // Objeto de paciente
    const patientObject = {
      name,
      owner,
      email,
      date,
      symptoms
    }

    if (patient.id) 
    {
      // Editando registro
      patientObject.id = patient.id;

      const updatePatients = patients.map( patientState => patientState.id === patient.id ? patientObject : patientState );

      setPatients(updatePatients);
      setPatient({});
    }
    else
    {
      // Nuevo registro
      patientObject.id = generateId();
      setPatients([...patients, patientObject]);
    }

    // Reinicia el formulario
    setName('');
    setOwner('');
    setEmail('');
    setDate('');
    setSymptoms('');
  }

  return (
    <div className="md:w-1/2 lg:w-2/5 mx-5">
      <h2 className="font-black text-3xl text-center">Patient Follow-up</h2>

      <p className="text-lg mt-5 text-center mb-10">
        Add patients and {''}
        <span className="text-indigo-600 font-bold">Manage them</span>
      </p>

      <form 
        onSubmit={handleSubmit}
        className="bg-white shadow-md rounded-lg py-10 px-5 mb-10">
        {error && <Error><p>All fields are mandatory</p></Error>}
        <div className="mb-5">
          <label htmlFor="pet" className="block text-gray-700 uppercase">
            Pet name
          </label>

          <input 
            id="pet" 
            type="text" 
            placeholder="name of the pet" 
            className="border-2 w-full p-2 mt-2 placeholder-indigo-400 rounded-md" 
            value={name} 
            onChange={ (e) => setName(e.target.value) } 
          />
        </div>

        <div className="mb-5">
          <label htmlFor="owner" className="block text-gray-700 uppercase">
            Owner name
          </label>

          <input 
            id="owner" 
            type="text" 
            placeholder="Owner name" 
            className="border-2 w-full p-2 mt-2 placeholder-indigo-400 rounded-md"
            value={owner} 
            onChange={ (e) => setOwner(e.target.value) }
          />
        </div>

        <div className="mb-5">
          <label htmlFor="email" className="block text-gray-700 uppercase">
            Email
          </label>

          <input 
            id="email" 
            type="email" 
            placeholder="Owner contact email" 
            className="border-2 w-full p-2 mt-2 placeholder-indigo-400 rounded-md"
            value={email} 
            onChange={ (e) => setEmail(e.target.value) }
          />
        </div>

        <div className="mb-5">
          <label htmlFor="discharge" className="block text-gray-700 uppercase">
            Discharge
          </label>

          <input 
            id="discharge" 
            type="date" 
            className="border-2 w-full p-2 mt-2 placeholder-orange-400 rounded-md"
            value={date} 
            onChange={ (e) => setDate(e.target.value) }
          />
        </div>

        <div className="mb-5">
          <label htmlFor="symptoms" className="block text-gray-700 uppercase">
            Symptoms
          </label>

          <textarea 
            id="symptoms" 
            className="border-2 w-full p-2 mt-2 placeholder-indigo-400 rounded-md" 
            placeholder="Description of symptoms" 
            value={symptoms} 
            onChange={ (e) => setSymptoms(e.target.value) }
          />
        </div>

        <input 
          type="submit" 
          className="bg-indigo-600 w-full p-3 text-white uppercase font-bold hover:bg-indigo-500 cursor-pointer transition-colors" 
          value={patient.id ? 'Edit Patient' : 'Add Patient'} />
        
      </form>
    </div>
  )
}

export default Form

