import { LightningElement, track, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountDomain.getAccounts';
import linkAccount from '@salesforce/apex/AccountDomain.linkAccount';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class InsertMultipleAccount extends LightningElement {

    allAccounts = [];
    recordFound;
    @track optionToShow = [];
    addSelected = "Add Selected" + "(" + 0 + ")";
    selectedOption = [];
    selectedRecordPresent = true;
    selectedRecords = [];

    @wire(getAccounts) getAccountHandler({ data, error }) {
        if (data) {
            this.allAccounts = data;
        }
        else if (error) {
            console.error(error);
        }
    }

    handleSearch(event) {
        let searchedResults = this.allAccounts.filter(currentAccount => {
            return currentAccount.Name.toLowerCase().includes((event.target.value).toLowerCase());
        });
        this.createOptions(searchedResults);
    }

    get option() {
        return this.optionToShow;
    }

    handleChange(event) {
        this.selectedOption = event.target.value;
        this.addSelected = "Add Selected" + "(" + this.selectedOption.length + ")";
    }

    createOptions(searchedResults) {
        if (searchedResults.length > 0) {
            this.recordFound = true;
            let temporaryOptions = [];
            for (let index = 0; index < searchedResults.length; index++) {
                temporaryOptions.push({ label: searchedResults[index].Name, value: searchedResults[index].Id });
            }
            this.optionToShow = temporaryOptions;
        }
        else {
            this.recordFound = false;
        }
    }

    handleClear(event) {
        this.selectedOption = [];
        this.addSelected = "Add Selected" + "(" + this.selectedOption.length + ")";
    }

    handleAddSelected(event) {
        let addNewSelection = [];
        this.selectedOption.forEach(element => {
            addNewSelection.push(
                {
                    recordId : element, 
                    recordURl: "https://resourceful-shark-mlszl7-dev-ed.lightning.force.com/" + element
                }
            )
        });
        this.selectedRecords.push(...addNewSelection);
        linkAccount({accountIds : this.selectedOption})
        .then(data => {
            this.showToast();
            this.selectedOption = [];
            this.addSelected = "Add Selected" + "(" + this.selectedOption.length + ")";
            this.removeSelectedAccount(this.allAccounts);
        })
        .catch (error => {

        })
    }

    get selectedRecords(){
        return this.selectedRecords;
    }

    showToast(){
        this.dispatchEvent(
            new ShowToastEvent({
                title : 'Account Link',
                message : 'Account is Linked Successfully',
                variant : 'success',
                mode : 'dismissible'
            })
        );
    }

    removeSelectedAccount(allAccounts) {
        allAccounts = allAccounts.filter( item => {
            for( var i=0, len=this.selectedRecords.length; i<len; i++ ){
                if( this.selectedRecords[i].recordId == item.Id ) {
                    return false;
                }
            }
            return true;
        });
       // console.log(allAccounts.length);
       this.allAccounts = allAccounts;
       this.createOptions(this.allAccounts);
    }
}