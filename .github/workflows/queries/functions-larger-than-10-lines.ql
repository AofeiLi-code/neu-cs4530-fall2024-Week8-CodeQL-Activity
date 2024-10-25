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
from Function f
where f.getNumLines() > 10
select f, "This function is longer than 10 lines."
