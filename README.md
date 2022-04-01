# Oystercard

Makers Academy week 2 pairing challenge. We created a working oystercard that can do the following (with corresponding tests completed):
- Touch in.
- Be declined if there are insufficient funds on the card.
- Add to / view your balance.
- Have a maximum limit on the card.
- Touch out.
- Be charged if you do not complete a journey correctly.
- View previous card journeys.

Each day we worked in different pairs. This repository was created and worked on by the following Makers students:

[Alexis Morcrette](https://github.com/almorcrette)

[Joseph Newman](https://github.com/Josenewmano)

[Joe Mcnally](https://github.com/jmcnally17)

[Coral Baker](https://github.com/Coral-Ann)


## Getting started

- Type `git clone https://github.com/Coral-Ann/oyster` into a local file.
- Once inside the repository, type `bundle`.

## Usage

- Use `irb` within the main repository folder, followed by `require ./lib/Oystercard.rb`.
- Make a new oystercard with `card = Oystercard.new`.
- If you do not wish to have insufficient balance, use `card.top_up(50)`, £90 is the maximum limit.
- View your balance with `card.balance`.
- You can use `card.touch_in('station name')` and `card.touch_out('station name')` to complete journeys. If you touch in twice / touch out twice, you will receive a penalty fare. Be sure to complete your journey!
- View your previous journeys by typing `card.journeys`. If it says 'nil', this means you did not complete a journey properly and were charged a penalty fare.


## Running tests

Type `rspec` to view test passes.


## User stories

The below are the user stories that we managed to complete.

```
In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```

## Functional representation of user stories

- A previous version of a wireframe was completed by Alexis and can be found [here](https://wireframe.cc/AmgxLr). This may also be updated to represent his following itterations of this code, found [here](https://github.com/almorcrette/oyster-cards) if you'd like to take a look.