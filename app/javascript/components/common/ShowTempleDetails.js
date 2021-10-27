import React, {useState, useEffect} from 'react'
import {Form, Row, Col, Button} from 'react-bootstrap'
import axios from 'axios'
import moment from 'moment';

const ShowTempleDetails = () => {

  const [templeData, setTempleData] = useState([])
  const [items, setItems] = useState()
  const [errorText, setErrorText] = useState()
  const [formContent, setFormContent] = useState({
        temple_name: templeData.temple_name || '',
        description: templeData.description || '',
        phone_no: templeData.phone_no || '',
        city: templeData.city || '',
        state: templeData.state || '',
        country: templeData.country || '',
        zipcode: templeData.zipcode || '',
        temple_address: templeData.temple_address || '',
        temple_email: templeData.temple_email || '',
        start_time: templeData.start_time || '',
        end_time: templeData.end_time || ''
    })

  const getTempleDetails = async () => {
       const url = '/temples'
        const CSRF_Token = document
            .querySelector('meta[name="csrf-token"]')
            .getAttribute('content')

        try {
            const response = await axios.get(`${url}`, {
                headers: {
                    'content-type': 'application/json',
                    'X-CSRF-Token': CSRF_Token,
                },
            })
            setTempleData(response.data.temples[0])
            console.log(response.data.temples[0])
            
        } catch (e) {
            console.error(e.message)
        }
    }

    const deleteTempleData = (id) => {
    let url = `/temples/${id}`
    axios.delete(url).then(res => {
      const del = templeData.filter(item => id !== item.id)
      setItems(del)
    })
  }

  useEffect(() => {
      getTempleDetails()
  }, [])

    const submitEditForm = async (id) => {
        event.preventDefault()
        const url = `/temples/${id}`
        const payload = {
          temple_name: templeData.temple_name,
          description: templeData.description,
          phone_no: templeData.phone_no,
          city: templeData.city,
          state: templeData.state,
          country: templeData.country,
          zipcode: templeData.zipcode,
          temple_address: templeData.temple_address,
          temple_email: templeData.temple_email,
          start_time: templeData.start_time,
          end_time: templeData.end_time
        }

          debugger
        var form_data = new FormData()
        for (var key in formContent) {
            form_data.append(`temple[${key}]`, formContent[key])
        }

        const CSRF_Token = document
            .querySelector('meta[name="csrf-token"]')
            .getAttribute('content')

        try {
          debugger
            const response = await axios.put(url, form_data, {
                headers: {
                    'content-type': 'multipart/form-data',
                    'X-CSRF-Token': CSRF_Token,
                },
            })

            if (!Object.keys(response.data).includes('error')) {
                console.log('error')
            } else {
                setErrorText(response.data.error)
            }
        } catch (e) {
            console.log(e.message, 'error')
            setErrorText('An error occurred: ', e.message)
        }
    }

    const startTime = moment(templeData?.start_time).format("DD MMM, YYYY  HH:mm")

    const handleInputField = (event, columnHeader) => {
      debugger
        const value = event.target.value

        setFormContent((prevState) => ({
            ...prevState, [columnHeader]: value,
        }))
    }

  return(
    <div>
      <Form>
        <Form.Group as={Row} className="mb-3">
          <Form.Label column sm="2">Temple Name</Form.Label>
          <Col sm="10">
            <Form.Control type="text" style={{width: '30%'}} 
              defaultValue={templeData?.temple_name}
              onChange={e => {handleInputField(e, 'temple_name')}}
            />
          </Col>
        </Form.Group>
        <Form.Group as={Row} className="mb-3">
          <Form.Label column sm="2">Temple Address</Form.Label>
          <Col sm="10">
            <Form.Control type="text" style={{width: '30%'}} 
              defaultValue={templeData?.temple_address}
              onChange={e => {e.target.value}}
            />
          </Col>
        </Form.Group>
        <Form.Group as={Row} className="mb-3" controlId="exampleForm.ControlInput1">
          <Form.Label column sm="2">Email</Form.Label>
          <Col sm="10">
            <Form.Control type="email" placeholder="name@example.com" style={{width: '30%'}} 
              defaultValue={templeData?.temple_email}
              onChange={e => {e.target.value}}
            />
          </Col>
        </Form.Group>
        <Form.Group as={Row} className="mb-3">
          <Form.Label column sm="2">City</Form.Label>
          <Col sm="10">
            <Form.Control type="text" style={{width: '30%'}} 
              defaultValue={templeData?.city}
              onChange={e => {e.target.value}}
            />
          </Col>
        </Form.Group>
        <Form.Group as={Row} className="mb-3">
          <Form.Label column sm="2">State</Form.Label>
          <Col sm="10">
            <Form.Control type="text" style={{width: '30%'}} 
              defaultValue={templeData?.state}
              onChange={e => {e.target.value}}
            />
          </Col>
        </Form.Group>
        <Form.Group as={Row} className="mb-3">
          <Form.Label column sm="2">Country</Form.Label>
          <Col sm="10">
            <Form.Control type="text" style={{width: '30%'}} 
              defaultValue={templeData?.country}
              onChange={e => {e.target.value}}
            />
          </Col>
        </Form.Group>
        <Form.Group as={Row} className="mb-3">
          <Form.Label column sm="2">Phone Number</Form.Label>
          <Col sm="10">
            <Form.Control type="text"style={{width: '30%'}} 
              defaultValue={templeData?.phone_no}
              onChange={e => {e.target.value}}
            />
          </Col>
        </Form.Group>
        <Form.Group as={Row} className="mb-3">
          <Form.Label column sm="2">Zipcode</Form.Label>
          <Col sm="10">
            <Form.Control type="number"style={{width: '30%'}} 
              defaultValue={templeData?.zipcode}
              onChange={e => {e.target.value}}
            />
          </Col>
        </Form.Group>
        <Form.Group as={Row} className="mb-3">
          <Form.Label column sm="2" >Description</Form.Label>
          <Col sm="10">
            <Form.Control as="textarea" rows={3} style={{width: '30%'}} 
              defaultValue={templeData?.description}
              onChange={e => {e.target.value}}
            />
          </Col>
        </Form.Group>
        <Form.Group as={Row} className="mb-3">
          <Form.Label column sm="2">Start Time</Form.Label>
          <Col sm="10">
            <Form.Control type="text"style={{width: '30%'}} 
              defaultValue={startTime}
              onChange={e => {e.target.value}}
            />
          </Col>
        </Form.Group>
        <Form.Group as={Row} className="mb-3">
          <Form.Label column sm="2">End Time</Form.Label>
          <Col sm="10">
            <Form.Control type="text"style={{width: '30%'}} 
              defaultValue={templeData?.end_time}
              onChange={e => {e.target.value}}
            />
          </Col>
        </Form.Group>
        <Button variant="primary" onClick={() => submitEditForm(templeData?.id)}>
          Edit
        </Button>
        <Button variant="primary" onClick={() => deleteTempleData(templeData?.id)} style={{marginLeft: '10px'}}>
          Delete
        </Button>
      </Form>
    </div>
  )
}

export default ShowTempleDetails