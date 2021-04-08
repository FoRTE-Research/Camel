void waitS1(){
    uint16_t debounce = 0;
    while(debounce < 1000){
        if(!(P1IN & BIT3)){     // If S1 (P1.3) pressed
            debounce++;
        } else{
            debounce = 0;
        }
    }
    while(!(P1IN & BIT3));      // Wait for negedge
}

int main(void){

    P2OUT &= ~(RED | GREEN | BLUE);
    P2OUT |= RED;
    waitS1();

    P2OUT &= ~(RED | GREEN | BLUE);
    P2OUT |= GREEN;
    waitS1();

    P2OUT &= ~(RED | GREEN | BLUE);
    P2OUT |= BLUE;
    waitS1();

    return 0;

}