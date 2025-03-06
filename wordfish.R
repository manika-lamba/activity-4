## load libraries
require(quanteda)
require(quanteda.textmodels)
require(quanteda.textplots)

## In this example, we will show how to apply Wordfish to the Irish budget speeches from 2010. First, we will create a document-feature matrix. Afterwards, we will run Wordfish.
toks_irish <- tokens(data_corpus_irishbudget2010, remove_punct = TRUE)
dfmat_irish <- dfm(toks_irish)
tmod_wf <- textmodel_wordfish(dfmat_irish, dir = c(6, 5))
summary(tmod_wf)

## We can plot the results of a fitted scaling model using textplot_scale1d().

textplot_scale1d(tmod_wf)

## The function also allows you to plot scores by a grouping variable, in this case the party affiliation of the speakers.

textplot_scale1d(tmod_wf, groups = dfmat_irish$party)

## Finally, we can plot the estimated word positions and highlight certain features.

textplot_scale1d(tmod_wf, margin = "features", 
                 highlighted = c("government", "global", "children", 
                                 "bank", "economy", "the", "citizenship",
                                 "productivity", "deficit"))
