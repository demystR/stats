# Demystifying Statistical Functions

Part of the [demystR](https://demystr.github.io) series. The book builds the mean, variance, standard error, t-tests, correlation, ANOVA and the general linear model from their equations, in R.

## Render

From this folder, run:

```r
install.packages(c("bookdown", "webexercises", "tidyverse"))
bookdown::render_book("index.Rmd", "bookdown::bs4_book")
```

The rendered HTML will be written to `docs/`. That folder is not committed: on every push to `main`, GitHub Actions (`.github/workflows/deploy.yml`) builds the book and publishes it to GitHub Pages.

## Structure

The book has three parts. The chapter order is set in `_bookdown.yml`. Files are named by part and position: `1a` to `1c` are Part I, `2a` to `2e` are Part II, `3a` to `3d` are Part III. A new chapter takes the next letter in its part, and the order in `_bookdown.yml` decides where it appears. Chapter numbers in the rendered book run straight through (1, 2, 3, ...). Chapters refer to each other with bookdown cross-references (`\@ref(id)`), so the numbers update themselves.

Before Part I:

- `0a-getting-started.Rmd` (`#getting-started`, unnumbered): creating a `demystify` RStudio project, the flat folder layout, downloading `my_functions.R`, installing tidyverse, and a setup check.

Part I: Basics and Summary Statistics

- `1a-functions.Rmd` (`#functions`): what functions are: input, process, output.
- `1b-equations.Rmd` (`#equations`): from equations to code; `my_mean()` and `my_var()`; the `my_functions.R` toolbox.
- `1c-standard-error.Rmd` (`#standard-error`): standard deviation, standard error, `my_summary()`, and z-scores.

Part II: Inferential Tests

- `2a-t-statistic.Rmd` (`#t-statistic`): a one-sample t-statistic built from earlier functions.
- `2b-two-sample-t.Rmd` (`#two-sample-t`): paired and independent t-tests.
- `2c-correlation.Rmd` (`#correlation`): covariance and correlation, turned into a t-value.
- `2d-one-way-anova.Rmd` (`#one-way-anova`), `2e-factorial-anova.Rmd` (`#factorial-anova`).

Part III: The General Linear Model

- `3a-lm-mean.Rmd` (`#lm-mean`), `3b-lm-correlation.Rmd` (`#lm-correlation`), `3c-lm-t-test.Rmd` (`#lm-t-test`), `3d-lm-one-way-anova.Rmd` (`#lm-one-way-anova`).

Null distributions, p-values and power are in [Demystifying Null Hypothesis Testing](https://github.com/demystR/nhst); rank tests are in the non-parametric book.

`parked/` holds chapter descriptions that are not in the book at the moment (generalised linear models, multilevel models, checking assumptions, and multiple predictors). They are not listed in `_bookdown.yml`, so they are not rendered. `parked/README.md` says why.

Supporting files:

- `exercises/`: one exercise file per chapter (from "From Equations to Code"), plus the `my_functions.R` template, organised under the same chapter headings. Copied into `docs/exercises/` on render.
- `R/functions.R`: reference versions of every function students build, under the same headings. Chapters from "Spread and Standard Error" onwards load it.
- `_common.R`: shared setup for every chapter; also copies the exercises and widgets into `docs/`.

## Widgets

Each widget is a self-contained HTML file with no server needed, embedded with an `<iframe>`. Edit the files in `apps/`, not the copies in `docs/apps/`.

- `apps/mean-variance/embed.html`: mean and variance of a normal distribution. `app.R` in the same folder is an older Shiny version.
- `apps/correlation/embed.html`: covariance and correlation.
- `apps/regression/embed.html`: find the line with the smallest sum of squared errors, then compare it with the least-squares line; residual squares, an error-by-slope panel, and gradient descent (for Correlation as a Linear Model; not embedded yet). `?challenge=0` unlocks everything for lectures.

## Style

The shared demystR theme is in `include/demystR.css`, with the footer in `include/demystR-footer.html`. Styles for this book only are in `stats.css`. `include/webex.css` and `include/webex.js` come from the webexercises package and run the hint and solution boxes.

## Shiny Versions

The book uses the browser widgets above. The older Shiny versions can still be run from this folder:

```r
install.packages(c("shiny", "ggplot2"))
shiny::runApp("apps/mean-variance")
```

