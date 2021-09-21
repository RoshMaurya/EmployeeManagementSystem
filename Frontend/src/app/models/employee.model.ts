export class Employee {

    constructor(
        public employeeId: number,
        public fName: string,
        public lName: string,
        public gender: string,
        public dateOfBirth: Date,
        public dateJoined: Date,
        public email: string,
        public phone: string,
        public street: string,
        public city: string,
        public state: string,
        public zipCode: string,
        public position?: string, 
        public dName?: string,
        public code?: string,
         //DName
    ) { }

}
