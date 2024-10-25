/**
 * @description Find functions that are longer than 10 lines 
 * @kind problem
 * @id javascript/functions-larger-than-100-lines
 * @problem.severity recommendation
 */
import javascript

/**
 * Finds functions that are longer than 10 lines.
 */
from Function function
where function.getNumLines() > 10
select function, "is longer than 10 lines."
