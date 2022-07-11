//
//  Solutions.swift
//  LeetcodeSolutions
//
//  Created by Vladimir Gusev on 11.07.2022.
//

import Foundation

// 2130. Maximum Twin Sum of a Linked List
func pairSum(_ head: ListNode?) -> Int {
    var currHead = head
    
    var values = [Int]()
    
    if let val = currHead?.val {
        values.append(val)
    }
    
    while (currHead?.next != nil) {
        currHead = currHead?.next
        
        if let val = currHead?.val {
            values.append(val)
        }
    }
    
    let middle = values.count / 2
    
    var maxSum = 0
    
    print(values)
    
    print(values[middle])
    
    for index in 0..<middle {
        let sum = values[index] + values[values.count - index - 1]
        maxSum = max(sum, maxSum)
    }
    
    return maxSum
}

// 2161. Partition Array According to Given Pivot
func pivotArray(_ nums: [Int], _ pivot: Int) -> [Int] {
    
    var leftSide = [Int]()
    var rightSide = [Int]()
    var middle = [Int]()
    
    for index in 0..<nums.count {
        if nums[index] == pivot {
            middle.append(nums[index])
        } else if nums[index] < pivot {
            leftSide.append(nums[index])
        } else {
            rightSide.append(nums[index])
        }
    }
    
    return leftSide + middle + rightSide
}

// 11. Container With Most Water
func maxArea(_ height: [Int]) -> Int {
    var left = 0
    
    var right = height.count - 1
    
    var maxArea = 0
    
    while left <= right {
        let distance = right - left
        
        let minHeight = min(height[left], height[right])
        
        let area = distance * minHeight
        
        if area > maxArea {
            maxArea = area
        }
        
        if height[left] < height[right] {
            left += 1
        } else {
            right -= 1
        }
        
    }

    return maxArea
}

// 832. Flipping an Image
func flipAndInvertImage(_ image: [[Int]]) -> [[Int]] {
    var newImage = image
    
    let size = image[0].count
    
    for row in 0..<image.count {
        
        for column in 0..<size / 2 {
            let temp = newImage[row][column]
            
            newImage[row][column] = newImage[row][size - column - 1]
            newImage[row][size - column - 1] = temp
        }
    }
    
    for row in 0..<image.count {
        for column in 0..<image[0].count {
            if newImage[row][column] == 0 {
                newImage[row][column] = 1
            } else {
                newImage[row][column] = 0
            }
        }
    }
    
    return newImage
}

// 2149. Rearrange Array Elements by Sign
func rearrangeArray(_ nums: [Int]) -> [Int] {
    var result = [Int]()
    
    var positive = [Int]()
    var negative = [Int]()
    
    for num in nums {
        if num > 0 {
            positive.append(num)
        } else {
            negative.append(num)
        }
    }
    
    for index in 0..<nums.count {
        if index % 2 == 0 {
            result.append(positive[index / 2])
        } else {
            result.append(negative[index / 2])
        }
    }
    
    return result
}

// 1877. Minimize Maximum Pair Sum in Array
func minPairSum(_ nums: [Int]) -> Int {
    let sorted = nums.sorted()
    
    var maxPair = 0
    
    for index in 0..<sorted.count / 2 {
        let left = sorted[index]
        let right = sorted[sorted.count - index - 1]
        
        maxPair = max(left + right, maxPair)
    }
    
    return maxPair
}

// 704. Binary Search
func search(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        let middle = (right + left) / 2
        
        if nums[middle] == target {
            return middle
        } else if nums[middle] > target {
            right = middle - 1
        } else {
            left = middle + 1
        }
    }
    
    return -1
}

// 1313. Decompress Run-Length Encoded List
func decompressRLElist(_ nums: [Int]) -> [Int] {
    var result = [Int]()
    
    for index in 0..<nums.count / 2 {
        let freq = nums[index * 2]
        let val = nums[index * 2 + 1]
        
        result += Array(repeating: val, count: freq)
    }
    
    return result
}

// 1720. Decode XORed Array
func decode(_ encoded: [Int], _ first: Int) -> [Int] {
    var result = [Int]()
    result.append(first)
    
    for index in 0..<encoded.count {
        result.append(result[index]^encoded[index])
    }

    return result
}

// 1389. Create Target Array in the Given Order
func createTargetArray(_ nums: [Int], _ index: [Int]) -> [Int] {
    var target = [Int]()
    
    for i in 0..<nums.count {
        target.insert(nums[i], at: index[i])
    }
    
    return target
}
