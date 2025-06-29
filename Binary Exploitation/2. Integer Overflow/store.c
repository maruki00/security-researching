// https://play.picoctf.org/practice/challenge/49?category=5&page=3

#include <stdio.h>
#include <stdlib.h>

void balance(int balance){
    printf("The Balance is %d\n", balance);
}
void BuyBalance(int *account_balance){
            printf("----------------------------------\n");
            printf("Currently ior sale\n");
            printf("1. Defintely not the flag Flag\n");
            printf("2. 1337 Flag\n");
            printf("----------------------------------\n$");
            int auction_choice;
            fflush(stdin);
            scanf("%d", &auction_choice);
            if(auction_choice == 1){
                printf("These knockoff Flags cost 900 each, enter desired quantity\n");

                int number_flags = 0;
                fflush(stdin);
                scanf("%d", &number_flags);
                if(number_flags > 0){
                    int total_cost = 0;
                    total_cost = 900*number_flags;
                    printf("\nThe final cost is: %d", total_cost);
                    if(total_cost <= *account_balance){
                        *account_balance = *account_balance - total_cost;
                        printf("\nYour current balance after transaction: %d\n", *account_balance);
                    }
                    else{
                        printf("Not enough funds to complete purchase\n");
                    }
                }
            } else if(auction_choice == 2){
                printf("1337 flags cost 100000 dollars, and we only have 1 in stock\n");
                printf("Enter 1 to buy one");
                int bid = 0;
                fflush(stdin);
                scanf("%d", &bid);

                if(bid == 1){
                    if(*account_balance > 100000){
                        FILE *f = fopen("flag.txt", "r");
                        if(f == NULL){

                            printf("flag file not found\n");
                            exit(0);
                        }
                        char buf[64];
                        fgets(buf, 63, f);
                        printf("YOUR FLAG IS: %s\n", buf);
                        }

                    else{
                        printf("\nNot enough funds for transaction\n\n\n");
                    }
                }
            }
}

int main()
{
    setbuf(stdout, NULL);
    int con;
    con = 0;
    int account_balance = 1100;
    printf("Welcome to MDA CTF\n");
    while(con == 0){

        printf("----------------------------\n");
        printf("1. Check Account Balance\n");
        printf("2. Buy Flags\n");
        printf("3. Exit\n");
        printf("----------------------------\n");
        int menu;
        printf("Enter a menu selection\n$");
        fflush(stdin);
        scanf("%d", &menu);
        switch(menu){
            case 1:
                balance(account_balance);
                break;
            case 2:
                BuyBalance(&account_balance);
                break;
            case 3:
                con = 1;
                break;
        }
    }
    return 0;
}
