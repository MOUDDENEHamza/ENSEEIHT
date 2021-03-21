import { Component, OnInit } from '@angular/core';
import {FormControl, FormGroup, Validators} from '@angular/forms';
import {HttpClient} from '@angular/common/http';

@Component({
  selector: 'app-add-person',
  templateUrl: './add-person.component.html',
  styleUrls: ['./add-person.component.css']
})
export class AddPersonComponent implements OnInit {

  person: FormGroup;

  constructor(private http: HttpClient) { }

  ngOnInit(): void {
    this.person = new FormGroup({
      firstName: new FormControl('', Validators.required),
      lastName: new FormControl('', Validators.required)
    });
  }

  onSubmit() {
    const url = 'http://dagobah.enseeiht.fr:8080/Agenda/Serv?op=';
    this.http.get(url + 'AddPerson?firstName=' + this.person.get('firstName').value
    + "&lastName=" + this.person.get('lastName').value).subscribe(
      response => {
        console.log(response);
      }
    );
  }

}
