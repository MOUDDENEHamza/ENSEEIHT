import { Component, OnInit } from '@angular/core';
import {FormControl, FormGroup, Validators} from '@angular/forms';
import {HttpClient} from '@angular/common/http';

@Component({
  selector: 'app-add-address',
  templateUrl: './add-address.component.html',
  styleUrls: ['./add-address.component.css']
})
export class AddAddressComponent implements OnInit {

  address: FormGroup;

  constructor(private http: HttpClient) { }

  ngOnInit(): void {
    this.address = new FormGroup({
      street: new FormControl('', Validators.required),
      city: new FormControl('', Validators.required)
    });
  }

  onSubmit() {
    const url = 'http://localhost:8080/Agenda/Serv?op=';
    this.http.get(url + 'AddAddress?street=' + this.address.get('street').value
    + "&city=" + this.address.get('city').value).subscribe(
      response => {
        console.log(response);
      }
    );
  }

}
