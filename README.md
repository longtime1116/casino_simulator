## What is this?

This is a casino simulator. 
You can use various betting systems to simulate some alternative games.
The betting systems that can be selected are as follows.
- martingale
- grand martingale
- parlay
- D'alembert
- pyramid


## How to use?
You can simulate SicBo by doing the following

```bash
$ ruby ./sicbo_sim.rb <try_count> <budget> <betting_system("martingale"|"dalembert")>
```

## Extra
Expected values of representative alternative game are as follows! :)

|Game|Expected values|
| --- | --- |
|American Roulette|18/38 = 0.47368421052|
|European Roulette|18/37 = 0.48648648648|
|Sic Bo|17/36 = 0.47222222222|
