// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// factorcpp
SEXP factorcpp(SEXP x, SEXP levs);
RcppExport SEXP _occurR_factorcpp(SEXP xSEXP, SEXP levsSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< SEXP >::type x(xSEXP);
    Rcpp::traits::input_parameter< SEXP >::type levs(levsSEXP);
    rcpp_result_gen = Rcpp::wrap(factorcpp(x, levs));
    return rcpp_result_gen;
END_RCPP
}
// groupsum
NumericVector groupsum(const NumericVector& x, int ng, const IntegerVector& g);
RcppExport SEXP _occurR_groupsum(SEXP xSEXP, SEXP ngSEXP, SEXP gSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const NumericVector& >::type x(xSEXP);
    Rcpp::traits::input_parameter< int >::type ng(ngSEXP);
    Rcpp::traits::input_parameter< const IntegerVector& >::type g(gSEXP);
    rcpp_result_gen = Rcpp::wrap(groupsum(x, ng, g));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_occurR_factorcpp", (DL_FUNC) &_occurR_factorcpp, 2},
    {"_occurR_groupsum", (DL_FUNC) &_occurR_groupsum, 3},
    {NULL, NULL, 0}
};

RcppExport void R_init_occurR(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}