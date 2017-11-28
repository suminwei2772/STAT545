context("Operations on non-numerics")

## Step 1: testing pow function
test_that("At least numeric values work.", {
	num_vec <- c(0, -4.6, 3.4)
	expect_identical(pow(numeric(0)), numeric(0))
	expect_identical(pow(num_vec), num_vec^2)
})

test_that("Logicals automatically convert to numeric.", {
	logic_vec <- c(TRUE, TRUE, FALSE)
	expect_identical(pow(logic_vec), logic_vec^2)
})


## Step 2: Test logarithm function
test_that("Log of 0 is -Inf.", {
	logarithm(as.numeric(0)) == "-Inf"
})

test_that("log does not work on negative numbers.", {
	logarithm(-5)
})


## Step 3: Test polar_transform function
test_that("cannot oprate on 0 vectors.", {
	polar_transform(0,0)
})


test_that("Logicals automatically convert to numeric.", {
	logic_vec <- c(TRUE, TRUE, FALSE)
	polar_transform(logic_vec, logic_vec)
})
