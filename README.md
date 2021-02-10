# Overview

This question was a good question to test basic knowledge of flutter and its various packages.

My solution for this challenge uses a Layered Architecture. I preferred this because of two reason

1. Pre-cooked code was using Layered Architecture.
2. This is a pretty small application with minimal set of features so it can be maintained using a layered architecture.

For state management I used bloc and flutter_bloc library. This is because I am familiar with this state management and I think it helps keep code modular and clean.

I believe I was allowed to use every resource available, so for the code in model, I used https://app.quicktype.io. This website allows us to make json specific models. I used this to speed up my coding process for the challenge and since the app is small, there is not much generalization required. (Although it can still be improved by discarding some redundant values).

For routing, I used named routing because it helps keep code clean and it further enables modularity. Router is available within screens inside of router folder.

# Assumptions

1. App is small
2. Uses single API
3. Only first page in the provided link is fetched, while taking a look at api, I noticed that changing /1/photos to /2/photos gives a second page.
4. Other project members are using layered architecture.

# Whats Left to do

1. Code for Testing
2. Implement pagination based on pages
3. We can also implement sorting feature that sorts photos based on id.

# Anything Else

Thank you for reviewing my code.
