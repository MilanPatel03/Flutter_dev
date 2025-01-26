import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.serviceapp.PageItem
import com.example.serviceapp.R

class ViewPagerAdapter(private val items: List<PageItem>) :
    RecyclerView.Adapter<ViewPagerAdapter.PageViewHolder>() {

    // ViewHolder holds the view for each page
    inner class PageViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val bgView: View = view.findViewById(R.id.bgView)
        val tvTitle: TextView = view.findViewById(R.id.tvPageTitle)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): PageViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.page_item, parent, false)
        return PageViewHolder(view)
    }

    override fun onBindViewHolder(holder: PageViewHolder, position: Int) {
        val item = items[position]
        holder.bgView.setBackgroundColor(item.color) // Set background color
        holder.tvTitle.text = item.title            // Set page title
    }

    override fun getItemCount(): Int = items.size
}
