# RandomStephen
Random number generation using Stephen Wolfram's Cellular Automata

![Snippet of how random number generation takes place](https://github.com/lchsam/RandomStephen/blob/master/ca.gif)

(I assure you when you run the program, the framerate is a lot better than this)

## Why
This was heavily inspired from Daniel Shiffman's Processing implementation of Stephen Wolfram's Cellular Automata. I became really interested Processing and how easy it is to code up something interesting really quickly. After watching countless talks Stephen Wolfram gave, He mentioned that his team at Wolfram Alpha uses Cellular Automata to generate random numbers. So, I took on the challenge to extract the supposed bits that each cell represents (Code written in January of 2018).

## More stuff
Feel free to take a look at `WolframCA.pde` and change the `bitCount`. `bitCount` is determines how many bits the program samples. Once you run it, the top row are the bits sampled, the second row are the supposed values. Second row to the left is the average of numbers sampled. You'll see that the random number generation is fairly random! (After running around 5 seconds using 3-bit sampling, the average ends up around 3.5!)

