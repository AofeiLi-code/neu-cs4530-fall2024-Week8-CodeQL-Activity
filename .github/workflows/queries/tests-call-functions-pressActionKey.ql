/**
 * @description Find tests that call a function called "pressActionKey" 
 * @kind problem
 * @id javascript/functions-transitively-called-by-tests
 * @problem.severity recommendation
 */
import javascript

/**
 * Find tests that call a function called "pressActionKey" 
 */
from FunctionCall fc, Function f
where f.getName() = "pressActionKey" and fc.getCallee() = f
select fc, "This test calls pressActionKey."
