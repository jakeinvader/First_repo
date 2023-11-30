function Patient({ patient, setPatient, deletePatient }) {

    const { name, owner, email, date, symptoms, id} = patient;

    function handleDelete() {
      const answer = confirm('Do you want to delete this patient?');

      if (answer) 
      {
        deletePatient(id);
      }
    }

  return (
    <div className='mx-5 my-10 bg-white shadow-md px-5 py-10 rounded-xl'>
        <p className='font-bold mb-3 text-gray-600 uppercase'>Name: {''}
          <span className='font-normal normal-case'>{name}</span>
        </p>

        <p className='font-bold mb-3 text-gray-600 uppercase'>Owner: {''}
          <span className='font-normal normal-case'>{owner}</span>
        </p>

        <p className='font-bold mb-3 text-gray-600 uppercase'>Email: {''}
          <span className='font-normal normal-case'>{email}</span>
        </p>

        <p className='font-bold mb-3 text-gray-600 uppercase'>Discharge date: {''}
          <span className='font-normal normal-case'>{date}</span>
        </p>

        <p className='font-bold mb-3 text-gray-600 uppercase'>Symptoms: {''}
          <span className='font-normal normal-case'>{symptoms}</span>
        </p>

        <div className="flex justify-between mt-10">
            <button
                type="button"
                className="py-2 px-10 bg-indigo-600 hover:bg-indigo-500 text-white font-bold uppercase rounded-lg"
                onClick={() => setPatient(patient)}
            >
                Edit
            </button>

            <button
                type="button"
                className="py-2 px-10 bg-red-600 hover:bg-red-500 text-white font-bold uppercase rounded-lg"
                onClick={handleDelete}
            >
                Delete
            </button>
        </div>

      </div>
  )
}

export default Patient
