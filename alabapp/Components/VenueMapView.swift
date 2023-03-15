//
//  VenueMapView.swift
//  alabapp
//
//  Created by Janet Lee on 3/14/23.
//

import SwiftUI

struct VenueMapView: View {
    
    var eventVenueMap: String
    let default_image = "city"
    
    @ViewBuilder
    func view(for phase: AsyncImagePhase) -> some View {
        switch phase {
        case .empty:
            ProgressView()
                .frame(width: (UIScreen.main.bounds.width))
        case .success(let image):
            image.resizable()
                .scaledToFill()
                .frame(width: (UIScreen.main.bounds.width))
        case .failure(let error):
            Image(default_image)
            VStack(spacing: 16) {
                Image(systemName: "xmark.octagon.fill")
                    .foregroundColor(.red)
                Text(error.localizedDescription)
                    .multilineTextAlignment(.center)
            }
        @unknown default:
            Text("Unknown")
                .foregroundColor(.gray)
        }
        
    }
    
    var body: some View {
        ZoomableScrollView {
            if !eventVenueMap.isEmpty {
                AsyncImage(url: URL(string: eventVenueMap), content: view)
                    .frame(width: (UIScreen.main.bounds.width))
            }
        }
    }
}


// Code source: https://stackoverflow.com/questions/58341820/isnt-there-an-easy-way-to-pinch-to-zoom-in-an-image-in-swiftui
struct ZoomableScrollView<Content: View>: UIViewRepresentable {
  private var content: Content

  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }

  func makeUIView(context: Context) -> UIScrollView {
    // set up the UIScrollView
    let scrollView = UIScrollView()
    scrollView.delegate = context.coordinator  // for viewForZooming(in:)
    scrollView.maximumZoomScale = 20
    scrollView.minimumZoomScale = 1
    scrollView.bouncesZoom = true

    // create a UIHostingController to hold our SwiftUI content
    let hostedView = context.coordinator.hostingController.view!
    hostedView.translatesAutoresizingMaskIntoConstraints = true
    hostedView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    hostedView.frame = scrollView.bounds
    scrollView.addSubview(hostedView)

    return scrollView
  }

  func makeCoordinator() -> Coordinator {
    return Coordinator(hostingController: UIHostingController(rootView: self.content))
  }

  func updateUIView(_ uiView: UIScrollView, context: Context) {
    // update the hosting controller's SwiftUI content
    context.coordinator.hostingController.rootView = self.content
    assert(context.coordinator.hostingController.view.superview == uiView)
  }

  // MARK: - Coordinator

  class Coordinator: NSObject, UIScrollViewDelegate {
    var hostingController: UIHostingController<Content>

    init(hostingController: UIHostingController<Content>) {
      self.hostingController = hostingController
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
      return hostingController.view
    }
  }
}

struct VenueMapView_Previews: PreviewProvider {
    static var previews: some View {
        VenueMapView(eventVenueMap: "https://alabmobile.blob.core.windows.net/images/map_v1.jpg")
    }
}
