//
//  DispatchingQueues.swift
//  Tiguer
//
//  Created by Bruce McTigue on 1/11/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import Foundation

public protocol Dispatching {
    func dispatch(_ work: @escaping () -> Void)
}

public class Dispatcher {
    let queue: DispatchQueue
    public init(queue: DispatchQueue) {
        self.queue = queue
    }
}

public class AsyncQueue: Dispatcher {}
extension AsyncQueue: Dispatching {
    public func dispatch(_ work: @escaping () -> Void) {
        queue.async(execute: work)
    }
}

public class SyncQueue: Dispatcher {}
extension SyncQueue: Dispatching {
    public func dispatch(_ work: @escaping () -> Void) {
        queue.sync(execute: work)
    }
}

private let safeQueue = DispatchQueue(label: "SafeQueue")

public class AsyncSafeQueue: Dispatcher {}
extension AsyncSafeQueue: Dispatching {
    public func dispatch(_ work: @escaping () -> Void) {
        queue.async(execute: work)
    }
}

public class SyncSafeQueue: Dispatcher {}
extension SyncSafeQueue: Dispatching {
    public func dispatch(_ work: @escaping () -> Void) {
        queue.sync(execute: work)
    }
}

extension AsyncQueue {
    public static let main: AsyncQueue = AsyncQueue(queue: .main)
    public static let global: AsyncQueue = AsyncQueue(queue: .global())
    public static let background: AsyncQueue = AsyncQueue(queue: .global(qos: .background))
    public static let safe: AsyncSafeQueue = AsyncSafeQueue(queue: safeQueue)
}

extension SyncQueue {
    public static let main: SyncQueue = SyncQueue(queue: .main)
    public static let global: SyncQueue = SyncQueue(queue: .global())
    public static let background: SyncQueue = SyncQueue(queue: .global(qos: .background))
    public static let safe: SyncSafeQueue = SyncSafeQueue(queue: safeQueue)
}
