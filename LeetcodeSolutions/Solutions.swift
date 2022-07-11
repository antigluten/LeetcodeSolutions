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
