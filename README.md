# RandomStephen
Random number generation using Stephen Wolfram's Cellular Automata

![Snippet of how random number generation takes place](https://github.com/lchsam/RandomStephen/blob/master/ca.gif)


## Why
This was heavily inspired from Daniel Shiffman's Processing implementation of Stephen Wolfram's Cellular Automata. I became really interested Processing and how easy it is to code up something interesting really quickly. After watching countless talks Stephen Wolfram gave, He mentioned that his team at Wolfram Alpha uses Cellular Automata to generate random numbers. So, I took on the challenge to extract the cells in the middle column and convert them to 0s and 1s. (Code written in January of 2018).

## More stuff
Feel free to take a look at `WolframCA.pde` and change the `bitCount`. `bitCount` determines how many bits the program samples. Once you run it, the top row are the bits sampled, the second row are the supposed values. Second row to the left is the average of numbers sampled. You'll see that the random number generation is fairly random!

