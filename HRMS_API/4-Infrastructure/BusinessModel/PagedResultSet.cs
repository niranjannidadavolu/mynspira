// ***********************************************************************
// Assembly         : Phoenix.Infrastructure.BusinessModel
// Author           : Seshu Kumar R S R
// Created          : 02-25-2020
//
// Last Modified By : Seshu Kumar R S R
// Last Modified On : 05-10-2020
// ***********************************************************************
// <copyright file="PagedResultSet.cs" company="PlaceholderCompany">
//     Copyright (c) PlaceholderCompany. All rights reserved.
// </copyright>
// <summary></summary>
// ***********************************************************************

using System.Collections.Generic;

namespace Phoenix.Infrastructure.BusinessModel
{
    /// <summary>
    /// Class PagedResultSet.
    /// </summary>
    /// <typeparam name="TEntity">The type of the t entity.</typeparam>
    public class PagedResultSet<TEntity>
    {
        /// <summary>
        /// Gets or sets the items.
        /// </summary>
        /// <value>The items.</value>
        public List<TEntity> Items { get; set; }

        /// <summary>
        /// Gets or sets the filtered count.
        /// </summary>
        /// <value>The filtered count.</value>
        public int FilteredCount { get; set; }

        /// <summary>
        /// Gets or sets the total items.
        /// </summary>
        /// <value>The total items.</value>
        public int TotalItems { get; set; }

        /// <summary>
        /// Gets or sets the index of the page.
        /// </summary>
        /// <value>The index of the page.</value>
        public int PageIndex { get; set; }

        /// <summary>
        /// Gets or sets the size of the page.
        /// </summary>
        /// <value>The size of the page.</value>
        public int PageSize { get; set; }
    }
}
