import { LightningElement, track } from 'lwc';

export default class InventorySystem extends LightningElement {
    @track data = [{
        itemName :'',
        rate :0,
        rateWith5 : 0,
        total : 0,
    }];
    datafound = false;
    connectedCallback(){
        if(this.data){
            this.datafound = true;
        }
    }
    handleAddRow() {
        this.data = [...this.data, {
            itemName :'',
            rate :0,
            rateWith5 : 0,
            total : 0,
        }];
        console.log(JSON.stringify(this.data));
    }
}