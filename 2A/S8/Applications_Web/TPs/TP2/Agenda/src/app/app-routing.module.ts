import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AddAddressComponent } from './add-address/add-address.component';
import { AddPersonComponent } from './add-person/add-person.component';
import { AssociateComponent } from './associate/associate.component';
import { HomeComponent } from './home/home.component';
import { ListComponent } from './list/list.component';

const routes: Routes = [
  {path: '', component: HomeComponent},
  {path: 'AddPerson', component: AddPersonComponent},
  {path: 'AddAddress', component: AddAddressComponent},
  {path: 'Associate', component: AssociateComponent},
  { path: 'List', component: ListComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
