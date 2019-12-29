//
//  AppError.swift
//  SNACC
//
//  Created by David Lin on 12/21/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import Foundation

enum AppError: Error {
  case badURL(String) // associated value
  case noResponse
  case networkClientError(Error) // no internet connection
  case noData
  case decodingError(Error)
  case encodingError(Error)
  case badStatusCode(Int) // 404, 500
  case badMimeType(String) // image/jpg

}
