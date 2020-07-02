def doUntilFalse firstInput, someProc
  input  = firstInput
  output = firstInput
  
  while output
    input  = output
    output = someProc.call input
  end
  
  input
end
 
buildArrayOfSquares = Proc.new do |array|
  lastNumber = array.last
  if lastNumber <= 0
    false
  else
    array.pop                         #  Take off the last number...  마지막 번호를 가져옴
    array.push lastNumber*lastNumber  #  ...and replace it with its square... 그 번호를 제곱한 값으로 교체함
    array.push lastNumber-1           #  ...followed by the next smaller number.  -
  end
end
 
alwaysFalse = Proc.new do |justIgnoreMe|
  false
end
 
puts doUntilFalse([5], buildArrayOfSquares).inspect
puts doUntilFalse('I\'m writing this at 3:00 am; someone knock me out!', alwaysFalse)
 
# #실행결과
 
# [25, 16, 9, 4, 1, 0]
# I'm writing this at 3:00 am; someone knock me out!

begin
  # iceberg!
rescue StandardError => e
  # lifeboats
end

