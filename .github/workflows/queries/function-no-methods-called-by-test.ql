/**
 * @description Find public methods not called by any test
 * @kind problem
 * @id javascript/public-methods-not-called-by-tests
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if the given function is a public method.
 */
predicate isPublicMethod(Function f) {
  exists(MethodDefinition md | md.isPublic() and md.getBody() = f)
}

/**
 * Holds if the given function is a test.
 */
predicate isTest(Function test) {
  exists(CallExpr describe, CallExpr it |
    describe.getCalleeName() = "describe" and
    it.getCalleeName() = "it" and
    it.getParent*() = describe and
    test = it.getArgument(1)
  )
}

/**
 * Holds if `caller` contains a call to `callee`.
 */
predicate calls(Function caller, Function callee) {
  exists(DataFlow::CallNode call |
    call.getEnclosingFunction() = caller and
    call.getACallee() = callee
  )
}

from Function function
where isPublicMethod(function) and
      not exists(Function test | isTest(test) and calls(test, function))
select function, "Public method is not called by any test: "
