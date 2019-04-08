def insertionSort(list)
	for i in 1...list.length do
		temp = list[i]
		j = i
		while j > 0 and list[j-1] > temp do
			list[j] = list[j-1]
			j = j - 1
		end
		list[j] = temp
	end
end

def selectionSort(list)
	for i in 0...list.length do
		min = i
		for j in i...list.length do
			if list[j] < list[min]
				min = j
			end
		end
	temp = list[min] 
	list[min] = list[i]
	list[i] = temp
	end
end

def bubbleSort(list)
	swapped = true
	cn = 1
	while swapped and cn < list.length do
		swapped = false
		for i in cn...list.length
			if list[i] < list[i-1]
				temp = list[i]
				list[i] = list[i-1]
				list[i-1] = temp
				swapped = true
			end
		end
	end
end

def mergeSort(list)
	if list.length > 1
		mid = (list.length - 1) / 2
		a = list[0..mid]
		b = list[mid + 1..list.length]
		a = mergeSort(a)
		b = mergeSort(b)
		list = merge(a, b)
	else
		list
	end
end

def merge(aa, bb)
	nlist = []
	len = aa.length + bb.length
	ri = 0
	li = 0
	while ri + li < len
		if (ri >= bb.length or (li < aa.length and aa[li] < bb[ri]))
			nlist = nlist + [aa[li]]
			li = li + 1
		else
			nlist = nlist + [bb[ri]]
			ri = ri + 1
		end
	end
	nlist
end

def quickSort(list, f, l)
	if f < l
		i = partition(list, f, l)
		quickSort(list, f, i)
		quickSort(list, i + 1, l)
	end
end

def partition(list, f, l)
	p = (f + l) / 2
	cp = f
	
	pivot = list[p]
	list[p] = list[l]
	list[l] = pivot
	
	for i in f..l
		if list[i] < pivot
			temp = list[cp]
			list[cp] = list [i]
			list [i] = temp
			cp = cp + 1
		end
	end
	
	list[l] = list[cp]
	list[cp] = pivot
	cp
end

def heapSort(list)
	list = buildHeap(list)
	i = list.length - 1
	
	while i > 1
		cur = list[1]
		list[1] = list[i]
		list[i] = cur
		i = i - 1
		swapDown(list, 1, i)
	end
	list[1, list.length]
end

def buildHeap(list)
	
	nlist = [0] + list
	
	i = (nlist.length - 1) / 2
		
	while i > 0
		swapDown(nlist, i, list.length - 1)
		i = i - 1
	end
	nlist
end

def swapDown(list, i, f)
		li = i*2
		ri = i*2 + 1
		
		m = i;
		
		if li <= f and list[li] > list[m]
			m = li
		end
		if ri <= f and list[ri] > list[m]
			m = ri
		end

		if m != i
			temp = list[i]
			list[i] = list[m]
			list[m] = temp
			swapDown(list, m, f)
		end

end

def processCommand(args, n)
	
	case args[0]
	when "out"
		puts args[1]
	when "exit"
		n = nil
	when "help"
		puts File.read "help.txt"
	when "disp"
		puts n.join " "
	when "def"
		n = [5, 4, 8, 7, 9, 1, 3, 6, 2]
		puts n.join " "
	when "set"
		n = []
		i = 1
		while i < args.length
			n = n + [args[i]]
			i = i + 1
		end
		
		puts n.join " "
	when "ins"
		insertionSort(n)
		puts n.join " "
	when "sel"
		selectionSort n
		puts n.join " "
	when "bub"
		bubbleSort n
		puts n.join " "
	when "merge"
		n = mergeSort n 
		puts n.join " "
	when "quick"
		quickSort(n, 0, n.length - 1)
		puts n.join " "
	when "heap"
		n = heapSort n 
		puts n.join " "
	else
		puts "\nInvalid command\n\n"
	end
	n
end

n = [5, 4, 8, 7, 9, 1, 3, 6, 2]
loop do
	print "Enter a command: "
	args = gets.chomp.split " "
	if args[0] == "script"
		if File.exist?(args[1])
			File.foreach(args[1]) { |i|
				a = i.split " "
				n = processCommand(a, n)
			}
		else
			puts "\nFile not found\n\n"
		end
	else
		n = processCommand(args, n)
		if n == nil
			break
		end
	end
end
