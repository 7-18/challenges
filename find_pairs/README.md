## Find pairs of integers from a list that sum to a given value

Edit the DATA.lst file and add the following lines (example):

```
1 9 5 0 20 -4 12 16 7 <- List of integers
12 <- Sum
```

**Note: Make sure to include a newline at the end of the file.**

## In terminal, run the code

```
cat DATA.lst | python find_pairs.py
```

The output should be:
```
5, 7
0, 12
-4, 16
```

## Run test

```
python -m unittest discover
```
