//
//  MKMapView+Annotation.swift
//  Utility
//
//  Created by Zhang, Wanming on 4/6/22.
//
import MapKit

extension MKMapView {

    func fitAllAnnotations(with edge: UIEdgeInsets) {
        var zoomRect: MKMapRect = .null
        
        annotations.forEach({
            let annotationPoint = MKMapPoint($0.coordinate)
            let pointRect = MKMapRect(x: annotationPoint.x, y: annotationPoint.y, width: 0.01, height: 0.01)
            zoomRect = zoomRect.union(pointRect)
        })
        setVisibleMapRect(zoomRect, edgePadding: edge, animated: true)
    }
    
    
    func fit(annotations: [MKAnnotation], shouldShow show: Bool, with edge: UIEdgeInsets) {
        var zoomRect: MKMapRect = .null
        annotations.forEach({
            let aPoint = MKMapPoint($0.coordinate)
            let rect = MKMapRect(x: aPoint.x, y: aPoint.y, width: 0.1, height: 0.1)
            zoomRect = zoomRect.isNull ? rect : zoomRect.union(rect)
        })
        if show {
            addAnnotations(annotations)
        }
        setVisibleMapRect(zoomRect, edgePadding: edge, animated: true)
    }
    
    func fit(annotations: [MKAnnotation], user: CLLocation, shouldCenterOnUser: Bool, with edge: UIEdgeInsets) {
        var zoomRect = MKMapRect.null
        let point = MKMapPoint(user.coordinate)
        let userRect = MKMapRect(x: point.x, y: point.y, width: 0, height: 0)
        zoomRect = zoomRect.union(userRect)
        
        annotations.forEach({
            let aPoint = MKMapPoint($0.coordinate)
            let rect = MKMapRect(x: aPoint.x, y: aPoint.y, width: 0.01, height: 0.01)
            zoomRect = zoomRect.isNull ? rect : zoomRect.union(rect)
        })
        addAnnotations(annotations)
        
        if shouldCenterOnUser {
            self.centerRectOnUser(user: point, rect: &zoomRect)
        }
        setVisibleMapRect(zoomRect, edgePadding: edge, animated: true)
    }
    
    private func centerRectOnUser(user: MKMapPoint, rect: inout MKMapRect) {
        let top = rect.origin.y
        let bottom = rect.origin.y + rect.height
        let left = rect.origin.x
        let right = rect.origin.x + rect.width
        
        let topDistance = fabs(user.y - top)
        let bottomDistance = fabs(bottom - user.y)
        let leftDistance = fabs(user.x - left)
        let rightDistance = fabs(right - user.x)
        
        let verticalDelta = fabs(topDistance - bottomDistance)
        let horizontalDelta = fabs(leftDistance - rightDistance)
        
        let newHeight = rect.height + verticalDelta
        let newWidth = rect.width + horizontalDelta
        
        if (topDistance < bottomDistance) {
            rect.origin.y -= verticalDelta
        }
        
        if (leftDistance < rightDistance) {
            rect.origin.x -= horizontalDelta
        }
        
        rect.size = MKMapSize(width: newWidth, height: newHeight)
    }
}
